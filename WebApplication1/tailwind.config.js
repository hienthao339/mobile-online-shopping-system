const withMT = require("@material-tailwind/html/utils/withMT");
module.exports = withMT({
    content: [
        './Pages/**/*.cshtml',
        './Views/**/*.cshtml'
    ],
    theme: {
        extend: {
            backgroundImage: {
                'hero-pattern': "url('/img/hero-pattern.svg')",
                'footer-texture': "url('/img/footer-texture.png')",
            }},
    },
    plugins: [],
})
