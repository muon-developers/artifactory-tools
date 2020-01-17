
def az_artifactory(name):
    native.sh_binary(
        name = "az-shell",
        srcs = ["script.sh"],
    )

