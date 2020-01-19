def _artifacts_repo_impl(ctx):
   print("Inside _impl")
   ctx.download("https://launchermeta.mojang.com/mc/game/version_manifest.json", output = "version_manifest.json")

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