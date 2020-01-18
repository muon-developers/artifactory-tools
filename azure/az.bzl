def _artifacts_repo_impl(ctx):
    cmd = ['az', 
    'artifacts',
    'universal',
    'download',
    '--organization', ctx.attr.org,
    '--scope', 'project',
    '--project', ctx.attr.project,
    '--feed', ctx.attr.feed,
    '--name', ctx.attr.package_name,
    '--version', ctx.attr.version,
    '--path', "."]
    exec_result = ctx.execute(cmd)
    print("exec_result: " + exec_result)
    if exec_result.stderr != "":
        print("Error occured: " + exec_result.stderr)
    if exec_result.return_code != 0:
        fail("Return code not zero for az_artifact_repo" + str(exec_result.return_code))

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