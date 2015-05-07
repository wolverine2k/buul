import QtQuick 2.0
import Qt.labs.particles 1.0

Item {
    anchors.fill: parent

    function explode() {
        particles.burst(50)
    }

    Particles {
        id: particles
        width: parent.width / 2
        height: parent.height / 2
        anchors.centerIn: parent
        lifeSpan: 1000
        lifeSpanDeviation: 2000
        source: "images/particle.png"
        angleDeviation: 360
        velocity: 50
        velocityDeviation: 50
        count: 0
    }
}
