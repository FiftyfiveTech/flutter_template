class EnvironmentConfig {
  static const BASE_URL = String.fromEnvironment('BASE_URL',
      defaultValue: "https://catfact.ninja/");
  //defaultValue: "https://api.themoviedb.org/3/");
  // static const IMAGE_BASE_URL = String.fromEnvironment('IMAGE_BASE_URL',
  //     defaultValue: "https://image.tmdb.org/t/p/w185");
  // static const API_KEY = String.fromEnvironment('API_KEY',
  //     //TODO add api key here
  //     defaultValue: "66f6536aa8f5fb81f9be557ff7a68991");
}
