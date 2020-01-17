
def test_shell(name):
    native.sh_binary(
        name = name,
        srcs = ["script.sh"],
    )

