/*const fs = require('fs')
const inquirer = require('inquirer')
const config = require('./config')
const command = require('./lib_node/command')
const series = require('async.series')

inquirer.prompt([{
  type: 'confirm',
  name: 'packages',
  message: 'Do you want to install packages from config.js?',
  default: false
}]).then(function (answers) {

  if(!answers.packages){
    return console.log('skipping package installs')
  }

  const tasks = [];

  ['brew', 'cask', 'npm', 'yarn', 'gem', 'pip', 'mas'].forEach( type => {
    if(config[type] && config[type].length){
      tasks.push((cb)=>{
        console.info(' installing '+type+' packages')
        cb()
      })
      config[type].forEach((item)=>{
        tasks.push((cb)=>{
          console.info(type+':', item)
          command('. lib_sh/echos.sh && . lib_sh/requirers.sh && require_'+type+' ' + item, __dirname, function(err, stdout, stderr) {
            if(err) console.error(err, stderr)
            console.log(stdout)
            cb()
          })
        })
      })
    }else{
      tasks.push((cb)=>{
        console.info(type+' has no packages')
        cb()
      })
    }
  })
  series(tasks, function(err, results) {
    console.log('package install complete')
  })
})*/