
def az_artifactory(name):
    native.sh_binary(
        name = name,
        srcs = ["script.sh"],
    )

