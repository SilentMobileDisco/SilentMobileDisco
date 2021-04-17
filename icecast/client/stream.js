window.addEventListener("load", function () {

    const initButton = document.getElementById("init-button");
    const playPause = document.getElementById("play-pause");
    playPause.style.display = "none";
    let isPlaying = false;
    
    function AudioMeter(analyser) {
        const canvas = document.createElement("canvas");
        canvas.style.width = "100%";
        let w = canvas.width = 600;
        const h = canvas.height = 300;
        const g = canvas.getContext("2d");

        const output = new Uint8Array(analyser.fftSize);

        function draw() {
            analyser.getByteTimeDomainData(output);

            g.clearRect(0,0,w,h);
            g.strokeStyle = "white";
            g.beginPath();
            g.moveTo(0,h/2);
            for (let i =0 ; i < output.length; i++) {
                const v = (output[i] / 128) - 1;
                g.lineTo(w * i/output.length, h/2 + (v* h/2));
            }

            g.stroke();
            window.requestAnimationFrame(draw);
        }
        window.requestAnimationFrame(draw);

        return canvas;
    }


    async function start() {
        const audio = new (window.AudioContext || window.webkitAudioContext)();
        const element = document.createElement("audio");
        //element.controls = true;
        document.body.append(element);

        element.src = "/silent-disco.mp3";

        const elementSource = audio.createMediaElementSource(element);
        const analyser = audio.createAnalyser();
        analyser.fftSize = 2048;


        elementSource.connect(analyser);

        const visualiser = AudioMeter(analyser);
        document.body.append(visualiser);

        elementSource.connect(audio.destination);
        await element.play();

        isPlaying = true;

        initButton.style.display = "none";
        playPause.style.display = "block";

        function pause() {
            element.src = "";
            element.pause();
            playPause.innerText = "Play";
            isPlaying = false;
        }

        function resume() {

            element.src = "/silent-disco.mp3";

            element.play();
            playPause.innerText = "Pause";
            isPlaying = true;
        }



        playPause.addEventListener("click", function() {
            if (isPlaying) {
                pause();
            } else {
                resume();
            }
        })

    }


    initButton.addEventListener("click", function () {
        start();
    })

});