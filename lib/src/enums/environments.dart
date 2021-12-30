enum Environment {
  development,
  staging,
  production,
}

extension EnvironmentsX on Environment {
  String asString() {
    switch (this) {
      case Environment.development:
        return 'development';
      case Environment.staging:
        return 'staging';
      case Environment.production:
        return 'production';
    }
  }
}
