// check if there's local storage color option
let mainColors = localStorage.getItem('color_option');

if (mainColors !== null) {

    document.documentElement.style.setProperty('--main-color', mainColors);

    // remove active class from all list items
    document.querySelectorAll(".colors-list li").forEach(element => {

        element.classList.remove('active');

        // add active class on elements with data-color === local storage item
        if (element.dataset.color === mainColors) {

            // add active class
            element.classList.add('active');

        }

    });

}

// random background option
let backgroundOption = true;

// variable to control the background interval
let backgroundInterval;

// check if there's local storage random background item
let backgroundLocalItem = localStorage.getItem('background_option');

// check is random background local storage is not empty
if (backgroundLocalItem !== null) {

    // remove active class from all spans
    document.querySelectorAll('.random-backgrounds span').forEach(element => {

        element.classList.remove('active');

    });

    if (backgroundLocalItem === 'true') {

        backgroundOption = true;

        document.querySelector('.random-backgrounds .yes').classList.add('active');

    } else {

        backgroundOption = false;

        document.querySelector('.random-backgrounds .no').classList.add('active');

    }

}

// toggle spin class on icon
let toggleSettings = document.querySelector('.toggle-settings .fa-gear');
toggleSettings.onclick = function () {

    // toggle class fa-spin for rotation on self
    this.classList.toggle('fa-spin');

    // toggle class open on main settings box
    document.querySelector('.settings-box').classList.toggle('open');
};

// switch colors
const colorsLi = document.querySelectorAll('.colors-list li');

// loop on list items
colorsLi.forEach(li => {

    // click on every list items
    li.addEventListener('click', (e) => {

        //set color on root
        document.documentElement.style.setProperty('--main-color', e.target.dataset.color);

        // set color on local storage
        localStorage.setItem('color_option', e.target.dataset.color);

        handleActive(e);

    });

});

// switch random background option
const randomBackEl = document.querySelectorAll('.random-backgrounds span');

// loop on all spans
randomBackEl.forEach(span => {

    // click on every span
    span.addEventListener('click', (e) => {

        handleActive(e);

        if (e.target.dataset.background === 'yes') {

            backgroundOption = true;

            randomizeImgs();

            localStorage.setItem('background_option', true);

        }else {

            backgroundOption = false;

            clearInterval(backgroundInterval);

            localStorage.setItem('background_option', false);

        }

    });

});

// select landing page element
let landingPage = document.querySelector('.landing-page');

// get array of img
let imgsArray = ["landing1.jpg", "landing2.jpg", "landing3.jpg", "landing4.jpg", "landing5.jpg"];

// function to randomize images
function randomizeImgs() {

    if (backgroundOption === true) {

        backgroundInterval = setInterval(() => {

            // get random number
            let randomNumber = Math.floor(Math.random() * imgsArray.length);

            // change background image url
            landingPage.style.backgroundImage = 'url("images/' + imgsArray[randomNumber] + '")';

        },5000);

    }

}
randomizeImgs();


// select skills selector
let ourSkills = document.querySelector(".skills");

window.onscroll = function () {

    // skills offset top
    let skillsOffsetTop = ourSkills.offsetTop;

    // skills outer height
    let skillsOuterHeight = ourSkills.offsetHeight;

    // window height
    let windowHeight = this.innerHeight;

    // scroll top
    let windowScrollTop = this.pageYOffset;

    if (windowScrollTop >= (skillsOffsetTop + skillsOuterHeight - windowHeight)) {

        let allSkills = document.querySelectorAll(".skill-box .skill-progress span");

        allSkills.forEach(skill => {

            skill.style.width = skill.dataset.progress;

        });

    }

};

// create popup with the image
let ourGallery = document.querySelectorAll(".gallery img");

ourGallery.forEach(img => {

    img.addEventListener('click', (e) => {

        // create overlay element
        let overlay = document.createElement("div");

        // add class to overlay
        overlay.className = 'popup-overlay';

        // append overlay to he body
        document.body.appendChild(overlay);

        // create the popup box
        let popupBox = document.createElement("div");

        // add class to he popup box
        popupBox.className = 'popup-box';

        if (img.alt !== null) {

            // create heading
            let imgHeading = document.createElement("h3");

            // create text for heading
            let imgText = document.createTextNode(img.alt);

            // append text to the heading
            imgHeading.appendChild(imgText);

            // append heading to the popup box
            popupBox.appendChild(imgHeading);

        }

        // create image
        let popupImage = document.createElement("img");

        // set image source
        popupImage.src = img.src;

        // add image to popup box
        popupBox.appendChild(popupImage);

        // add popup box to body
        document.body.appendChild(popupBox);

        // create close span
        let closeButton = document.createElement("span");

        // create the close button text
        let closeButtonText = document.createTextNode("X");

        // append text to close button
        closeButton.appendChild(closeButtonText);

        // add class to close button
        closeButton.className = 'close-button';

        // add close button to the popup box
        popupBox.appendChild(closeButton);

    });

});

// close popup
document.addEventListener("click", (e) => {

    if (e.target.className == 'close-button' || e.target.className == 'popup-overlay') {

        // remove the current popup
        // e.target.parentNode.remove();
        document.querySelector(".popup-box").remove();

        // remove overlay
        document.querySelector(".popup-overlay").remove();

    }

});

// select all bullets
const allBullets = document.querySelectorAll(".nav-bullets .bullet");

// select all bullets
const allLinks = document.querySelectorAll(".links a");


function scrollIntoElements(elements) {

    elements.forEach(element => {

        element.addEventListener("click", (e) => {

            e.preventDefault();

            document.querySelector(e.target.dataset.section).scrollIntoView({

                behavior: 'smooth'

            });

        });

    });

}

scrollIntoElements(allBullets);
scrollIntoElements(allLinks);

// handle active state
function handleActive(ev) {

    // remove active class from all children
    ev.target.parentElement.querySelectorAll(".active").forEach(element => {

        element.classList.remove('active');

    });

    // add active class on self
    ev.target.classList.add('active');

}

// bullets option
let bulletsSpan = document.querySelectorAll(".bullets-option span");

let bulletsContainer = document.querySelector(".nav-bullets");

let bulletLocalItem = localStorage.getItem("bullets_option");

if (bulletLocalItem != null) {

    bulletsSpan.forEach(span => {

        span.classList.remove("active");

    });

    if (bulletLocalItem === 'block') {

        bulletsContainer.style.display = 'block';

        document.querySelector(".bullets-option .yes").classList.add("active");

    } else {

        bulletsContainer.style.display = 'none';

        document.querySelector(".bullets-option .no").classList.add("active");

    }

}

bulletsSpan.forEach(span => {

    span.addEventListener("click", (e) => {

        if (span.dataset.display === 'show') {

            bulletsContainer.style.display = 'block';

            localStorage.setItem("bullets_option", 'block');

        } else {

            bulletsContainer.style.display = 'none';

            localStorage.setItem("bullets_option", 'none');

        }

        handleActive(e);

    });

});

// reset button
document.querySelector(".reset-options").onclick = () => {

    // localStorage.clear();
    localStorage.removeItem("color_option");
    localStorage.removeItem("background_option");
    localStorage.removeItem("bullets_option");

    // reload window
    window.location.reload();

}

// toggle menu
let toggleMenu = document.querySelector(".toggle-menu");
let tLinks = document.querySelector(".links");

toggleMenu.onclick = function (e) {

    // stop propagation
    e.stopPropagation();

    // toggle class "menu-active" on button
    this.classList.toggle("menu-active");

    // toggle class "open" on links
    tLinks.classList.toggle("open");

    // close the settings box
    let settingsBox = document.querySelector('.settings-box');

    if (settingsBox.classList.contains("open")) {

        // toggle class "open" on links
        settingsBox.classList.toggle("open");

        toggleSettings.classList.toggle('fa-spin');

    }

};

// stop propagation on the menu
tLinks.onclick = function (e) {

    e.stopPropagation();

}

// click anywhere outside menu and toggle button
document.addEventListener("click", (e) => {

    if (e.target !== toggleMenu && e.target !== tLinks) {

        // check if menu is open
        if (tLinks.classList.contains("open")) {

            // toggle class "menu-active" on button
            toggleMenu.classList.toggle("menu-active");

            // toggle class "open" on links
            tLinks.classList.toggle("open");

        }

    }

});

// dark mode option
let darkMode = document.querySelectorAll(".light-mode");

let darkOption = document.querySelectorAll(".dark-option span");

darkOption.forEach(span => {

    span.addEventListener("click", (e) => {

        if (span.dataset.mode === 'dark') {

            darkModeSwitch(darkMode);

        } else {

            darkModeSwitch(darkMode);

        }

        handleActive(e);

    });

});

function darkModeSwitch(element) {

    element.forEach(ele => {

        if (ele.classList.contains("light-mode")) {

            ele.classList.remove("light-mode");

            ele.classList.add(ele.dataset.mode);

        } else {

            ele.classList.remove("dark-mode");

            ele.classList.add("light-mode");

        }

    });
}
