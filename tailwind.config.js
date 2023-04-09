module.exports = {
  content: [],
  theme: {
    letterSpacing: {
      tighter: "-0.5rem",
      widest: "3rem"
    },
    extend: {
      
    },
  },
  plugins: [
    require('@tailwindcss/forms')({
      strategy: 'class',
    })
  ],
  content: [
    './assets/**/*.html',
    './src/**/*.rs',
    './css/**/*.css',
    '.git-submodules/clubhouse/templates/**/*.j2',
    '.git-submodules/clubhouse/src/**/*.rs'
  ],
}
