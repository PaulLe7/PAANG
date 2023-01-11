/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/components/**/*.{js,ts,jsx,tsx}',
    './src/pages/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {
      colors: {
        'secondary-grey-light': '#E3E3E3',
        'secondary-grey-light-2': '#F9FAFB',
      }
    },
  },
  plugins: [],
}