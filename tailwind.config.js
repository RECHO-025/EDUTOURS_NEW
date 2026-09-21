import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
    ],

    theme: {
        extend: {
            fontFamily: {
                sans: ['Figtree', ...defaultTheme.fontFamily.sans],
                serif: ['"EB Garamond"', 'Georgia', 'serif'],
            },
            colors: {
                brand: {
                    50: '#eef1f7',
                    100: '#dbe2ee',
                    200: '#b3c0dc',
                    300: '#8b9dc9',
                    400: '#5a6fa3',
                    500: '#33487d',
                    600: '#1a2f5c',
                    700: '#12234a',
                    800: '#0b1a38',
                    900: '#060f22',
                    DEFAULT: '#1a2f5c',
                },
                accent: {
                    50: '#faf7f2',
                    100: '#f2ece2',
                    200: '#e4d8c8',
                    300: '#cdbba3',
                    400: '#ab9478',
                    500: '#8a7458',
                    600: '#6b5b45',
                    700: '#514536',
                    800: '#382f25',
                    900: '#201b15',
                    DEFAULT: '#8a7458',
                },
                gold: {
                    50: '#fdf3ec',
                    100: '#f9e2d0',
                    200: '#f0c39c',
                    300: '#e5a066',
                    400: '#d97f3d',
                    500: '#c2652a',
                    600: '#a04f1f',
                    700: '#7d3d19',
                    800: '#5c2d14',
                    900: '#3d1e0e',
                    DEFAULT: '#c2652a',
                },
            },
        },
    },

    plugins: [forms],
};
