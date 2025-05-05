variable "WITH_LATEST_TAG" {
    default = false
}

variable "KEYCLOAK_VERSION" {
    default = "26.2.3"
}

group "default" {
    targets = ["keycloak-fix-ja"]
}

target "keycloak-fix-ja" {
    context = "./build"
    args = {
        KEYCLOAK_VERSION = "${KEYCLOAK_VERSION}"
    }
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ]
    tags = [
        "toras9000/keycloak-fix-ja:${KEYCLOAK_VERSION}",
        "ghcr.io/toras9000/keycloak-fix-ja:${KEYCLOAK_VERSION}",
        WITH_LATEST_TAG ? "toras9000/keycloak-fix-ja:latest": "",
        WITH_LATEST_TAG ? "ghcr.io/toras9000/keycloak-fix-ja:latest": "",
    ]
}
