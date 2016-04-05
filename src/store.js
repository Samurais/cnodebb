/**
 * Store
 * save file with qiniu client
 */
var qn = require('qn');
var nconf = require('nconf');
var winston = require('winston');
var fs = require('fs');

// Qiniu client
var qnClient = null;

if (nconf.get("qn") && nconf.get("qn:secretKey") !== 'your secret key') {
    winston.info("[store] Initialize Qiniu Client.");
    qnClient = qn.create(nconf.get("qn"));
}

function _upload(filePath, callback) {
    if (qnClient) {
        // upload to qiniu
        // upload a file with custom key 
        qnClient.uploadFile(filePath, function(err, result) {
            winston.info("Upload " + filePath + " with Qiniu Client.");
            if (err)
                return callback(err);
            // console.log(result);
            // { 
            //   hash: 'FhGbwBlFASLrZp2d16Am2bP5A9Ut', 
            //   url: 'qtestbucket.qiniudn.com/qn/lib/client.js' 
            //   "x:ctime": "1378150371", 
            //   "x:filename": "client.js", 
            //   "x:mtime": "1378150359", 
            //   "x:size": "21944", 
            // } 
            callback(null, "//" + result.url);
            // TODO delete the old file
            winston.verbose("File upload to " + JSON.stringify(result));
            fs.unlink(filePath, function(err, info) {
                if (err)
                    winston.warn('File deletion failure, ' + filePath);
            });
        });
    } else {
        // do nothing, since the files are saved into 
        // local path.
        callback();
    }
}

exports.upload = _upload;
