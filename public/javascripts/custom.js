window.onload = function(){
    // let add_new_item = document.getElementsByClassName("add-new-item")[0]
    let delete_button = document.getElementById("delete")
    delete_button.addEventListener("click", function(){
    let overlay = document.getElementById("overlay")
        overlay.style.display = "flex"
        overlay.style.justifyContent = "center"
        overlay.style.alignItems = "center"
        overlay.addEventListener("click", function(){
            overlay.style.display= "none"
        })
    })
}