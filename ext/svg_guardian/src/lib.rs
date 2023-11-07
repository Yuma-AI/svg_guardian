use magnus::{
    exception::ExceptionClass, function, gc::register_mark_object, prelude::*, value::Lazy, Error,
    RModule, Ruby,
};
use svg_hush::{data_url_filter, Filter};

static SVG_GUARDIAN_SANITIZE_ERROR: Lazy<ExceptionClass> = Lazy::new(|ruby| {
    let ex = ruby
        .class_object()
        .const_get::<_, RModule>("SvgGuardian")
        .unwrap()
        .const_get("SanitizeError")
        .unwrap();
    // ensure `ex` is never garbage collected (e.g. if constant is
    // redefined) and also not moved under compacting GC.
    register_mark_object(ex);
    ex
});

fn sanitize(svg: String) -> Result<String, Error> {
    let ruby = unsafe { Ruby::get_unchecked() };
    let mut filter = Filter::new();
    let mut out = Vec::new();
    filter.set_data_url_filter(data_url_filter::allow_standard_images);

    if let Err(e) = filter.filter(&mut svg.as_bytes(), &mut out) {
        return Err(Error::new(
            ruby.get_inner(&SVG_GUARDIAN_SANITIZE_ERROR),
            e.to_string(),
        ));
    } else {
        return Ok(String::from_utf8(out).unwrap());
    };
}

#[magnus::init]
fn init(ruby: &Ruby) -> Result<(), Error> {
    let module = ruby.define_module("SvgGuardian")?;
    module.define_singleton_method("sanitize", function!(sanitize, 1))?;
    Ok(())
}
