default["java"]["packages"] = value_for_platform_family(
    "debian" => %w(
      ca-certificates-java
      openjdk-11-jre
      openjdk-11-jre-headless
    )
)