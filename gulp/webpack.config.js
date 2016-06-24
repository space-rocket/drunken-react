var path = require('path');

module.exports = {
    entry: "./client/app/app.js",
    output: {
        filename: "./priv/static/js/bundle.js",
        sourceMapFilename: "./priv/static/js/bundle.map"
    },
    devtool: '#source-map',
    module: {
        loaders: [
            {
                loader: 'babel',
                exclude: /node_modules/
            }
        ]
    }
}
