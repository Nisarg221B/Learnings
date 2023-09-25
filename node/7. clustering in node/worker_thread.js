const {
    isMainThread,
    workerData,
    Worker,
} = require('worker_threads');


if(isMainThread){
    console.log(`Main thread! ProcessID: ${process.pid}`);
    new Worker(__filename,{
        workerData:[34,23,11,43,22,55,9],
    });
    new Worker(__filename,{
        workerData:[32,63,33,45,2,555,29],
    });
} else{
    console.log(`Worker! Process ID: ${process.pid}`);
    console.log(`${workerData} sorted is [ ${workerData.sort((a,b)=> a-b)} ]`);
}