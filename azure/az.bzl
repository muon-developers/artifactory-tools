def _artifacts_repo_impl(ctx):
    ctx.execute(['az', 'artifacts', 'universal', 'download', '--organization', ctx.attr.org, '--scope', 'project', '--project', ctx.attr.project, '--feed', ctx.attr.feed ,'--name', ctx.attr.package_name, '--version', ctx.attr.version, '--path', "."])

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