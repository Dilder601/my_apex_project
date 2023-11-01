const dhuNode = document.querySelectorAll(".DHU");

dhuNode.forEach(dNode => {
    if(!dNode.textContent.trim()){
        dNode.parentElement?.parentElement?.children[dNode.parentElement?.parentElement?.children?.length -1]?.lastElementChild.classList.add('dhu-d-none')
    }
})





STATIC ID :  ON CLASSIC REPORT COLUMN

DHU