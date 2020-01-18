def _artifacts_repo_impl(ctx):
    ctx.file("hello.txt", ctx.attr.feed)

az_artifacts_repo = repository_rule(
    implementation = _artifacts_repo_impl,
    attrs = {
        "org": attr.string(
            mandatory = True,
        ),
        "project": attr.string(
            mandatory = True,
        ),
        "feed": attr.string(
            mandatory = True,
        ),
        "package_name": attr.string(
            mandatory = True,
        ),
        "version": attr.string(
            mandatory = True,
        ),
    },
)