"""Smoke test: proves the environment and toolchain work end to end."""


def test_environment_is_usable() -> None:
    assert 1 + 1 == 2


def test_app_package_imports() -> None:
    import app

    assert app is not None
