$(function() {

    var name, started = false;

    var comet_server = function(){
        console.log("comet_server");
        socket.send("hello subscribe");
    };
    var interval = 1000 * 30 *1;
    setInterval(comet_server, interval);

    

    
    //var comet = function() {
        //var value = $('#comet').val();
        //console.log("formsubmit");
        //data = {type:"answer", action: 'message'}
        //socket.send(data);
        
        //$('#message').val('').focus();
        //return false;
    //};


    var messaged = function(data) {
        console.log("messaged");
        console.log(data);
        console.log("what s hell");
        if(data.action == "join")
        {

            console.log("its coming inside switch case");
            addItem(data.name)
            
        }
        /*
        switch (data.action) {
            case 'in-use':
                alert('Name is in use, please choose another');
                break;
            case 'started':
                console.log("switch started");
                started = true;
                $('#submit').val('Send');
                $('#users').slideDown();
                $.each(data.users, function(i, name) {
                    addUser({name: name});
                });
                break;
            case 'join':
                console.log("switch join");
                addUser(data, true);
                break;
            case 'leave':
                console.log("switch leave");
                removeUser(data);
                break;
            case 'message':
                console.log("switch message");
                addMessage(data);
                break;
            case 'system':
                data['name'] = 'SYSTEM';
                addMessage(data);
                break;
        }*/
    };

    

    var start = function() {
        socket = new io.Socket();
        console.log("socket start");
        socket.connect();
        console.log("socket connected");
        //socket.on('connect', connected);
        console.log("socket disconnected");
        //socket.on('disconnect', disconnected);
        console.log("socket messaged");
        socket.on('message', messaged);
    };
    start();
});
