def _artifacts_repo_impl(ctx):
   print("Inside _impl")
   exec_result = ctx.execute(["mkdir", "-p", "tintin"])
   print("exec_result " + exec_result.stderr)
   if exec_result.stderr != "":
        print("Error occured: " + exec_result.stderr)
   if exec_result.return_code != 0:
        print("Return code not zero for " + str(exec_result.return_code))

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