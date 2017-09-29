var jwt = ''
var kanali = []
var channelId = ''

function logIn(result) {
    var userName = usernameInput.text
    var pin = pinInput.text

    var http = new XMLHttpRequest;
    var url = "http://176.31.182.158:3001/auth/local";
    var params = {"identifier": userName,"password": pin};
    var response = '';
    http.open("POST", url, true);
    http.setRequestHeader("Content-Type", "application/json");

    http.onreadystatechange = function() {
         if (http.readyState == 4) {
             if (http.status == 200) {
                 busyIndicator.running = false
                 rectangle.state = "CHANNELS"
                 jwt = JSON.parse(http.responseText).jwt
                 getChannels()
             } else if (http.status == 403){
                 console.log("error: " + http.status + http.responseText)
                 busyIndicator.running = false
                 errorText.text = "Invalid User Name or PIN."
             } else if (http.status == 400) {
                 busyIndicator.running = false
                 errorText.text = "The input fields are empty."
             }
         }
     }
    http.send(JSON.stringify(params));
}

function getChannels() {
    var http = new XMLHttpRequest;
    var url = "http://176.31.182.158:3001/channels";

    http.open("GET", url, true);

    http.onreadystatechange = function() {
        if (http.readyState == 4) {
            if (http.status == 200) {
                console.log("proslo")
                kanali = JSON.parse(http.responseText)
                console.log(kanali.length)
                if (kanali.length > 0) {
                    for (var key in kanali) {
                        noChannelsText.text = ""
                        var name = kanali[key].name
                        var url = kanali[key].url
                        var id = kanali[key].id
                        listaModel.append({"name": name, "url": url, "id": id});
                        loading.running = false
                    }
                } else {
                    noChannelsText.text = "No channels"
                    loading.running = false
                }


            } else if (http.status == 403){
                console.log("error: " + http.status + http.responseText)
            } else if (http.status == 400) {
                console.log("error: " + http.status + http.responseText)
            }
        }
    }
    http.send();
}

function addChannel(name, channelUrl) {
    loading.running = true
    var http = new XMLHttpRequest;
    var url = "http://176.31.182.158:3001/channels";
    var params = {"name": name, "url": channelUrl};

    http.open("POST", url, true);
    http.setRequestHeader('Authorization', 'Bearer ' + jwt);
    http.setRequestHeader("Content-Type", "application/json");

    http.onreadystatechange = function() {
         if (http.readyState == 4) {
             if (http.status == 201) {
                 addChannelWindow.close()
                 console.log("kanal dodan")
                 addNewChannelButton.text = 'Add channel'
                 nameInput.text = ""
                 urlInput.text = ""
                 listaModel.clear()
                 getChannels()
             } else if (http.status == 403){
                 console.log("error: " + http.status + http.responseText)
             } else if (http.status == 400) {
                 console.log("error: " + http.status + http.responseText)

             }
         }
     }
    http.send(JSON.stringify(params));
}

function editChannel(name, url) {
    loading.running = true
    print(name, url, channelId, jwt)

    var http = new XMLHttpRequest;
    var httpUrl = "http://176.31.182.158:3001/channels/" + channelId;
    var params = {"name": name, "url": url};

    http.open("PUT", httpUrl, true);
    http.setRequestHeader('Authorization', 'Bearer ' + jwt);
    http.setRequestHeader("Content-Type", "application/json");

    http.onreadystatechange = function() {
         if (http.readyState == 4) {
             if (http.status == 200) {
                 editChannelWindow.close()
                 loading.running = false
                 nameEdit.text = ""
                 urlEdit.text = ""
                 listaModel.clear()
                 getChannels()
             } else if (http.status == 403){
                 loading.running = false
                 console.log("error: " + http.status + http.responseText)
             } else if (http.status == 400) {
                 loading.running = false
                 console.log("error: " + http.status + http.responseText)
             }
         }
     }
    http.send(JSON.stringify(params));
}

function saveParemeters( id) {
    channelId = id;
}

function refreshChannels() {
    listaModel.clear()
    getChannels()
}

function logOut() {
    rectangle.state = "LOGIN"
    usernameInput.text = ""
    pinInput.text = ""
    listaModel.clear()
}

function deleteChannel(id) {
    loading.running = true

    var http = new XMLHttpRequest;
    var url = "http://176.31.182.158:3001/channels/" + id;

    http.open("DELETE", url, true);
    http.setRequestHeader('Authorization', 'Bearer ' + jwt);

    http.onreadystatechange = function() {
         if (http.readyState == 4) {
             if (http.status == 200) {
                 console.log("kanal izbrisan")
                 loading.running = false
                 listaModel.clear()
                 getChannels()
             } else if (http.status == 403){
                 loading.running = false
                 console.log("error: " + http.status + http.responseText)                 
             } else if (http.status == 400) {
                 loading.running = false
                 console.log("error: " + http.status + http.responseText)
             }
         }
     }
    http.send();
}
