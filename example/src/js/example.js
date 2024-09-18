import { testPermissionIos } from 'test-permission-ios';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    testPermissionIos.echo({ value: inputValue })
}
