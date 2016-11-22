while (document.body.firstChild) {
    document.body.removeChild(document.body.firstChild);
}
//runElmProgram();
var storedState = localStorage.getItem('ve-vlaku-save');
var startingState = storedState ? JSON.parse(storedState) : null;
var storedSettings = localStorage.getItem('ve-vlaku-settings');
var startingSettings = storedSettings ? JSON.parse(storedSettings) : null;

var main = Elm.Main.fullscreen({ settings: startingSettings, state: startingState });

main.ports.saveGame.subscribe(function (state) {
    localStorage.setItem('ve-vlaku-save', JSON.stringify(state));
});
main.ports.saveSettings.subscribe(function (settings) {
    localStorage.setItem('ve-vlaku-settings', JSON.stringify(settings));
});                
