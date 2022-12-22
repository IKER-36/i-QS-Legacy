window.addEventListener('message', function (event) {

	switch (event.data.action) {
        case 'updateStatusHud':
            $("body").css("display", event.data.show ? "block" : "none");
            $("#boxSetHealth").css("width", event.data.health + "%");
            $("#boxSetArmour").css("width", event.data.armour + "%");
            $("#boxSetHunger").css("width", event.data.hunger + "%");
            $("#boxSetThirst").css("width", event.data.thirst + "%");
    }
});

function widthHeightSplit(value, ele) {
    let height = 25.5;
    let eleHeight = (value / 100) * height;
    let leftOverHeight = height - eleHeight;

    ele.css("height", eleHeight + "px");
    ele.css("top", leftOverHeight + "px");
};