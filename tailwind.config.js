module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  plugins: [
    require('daisyui'),
    require('@tailwindcss/forms'),
  ],
  daisyui: {
    themes: ["cupcake"],
  },
}
