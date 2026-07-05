import Foundation

struct Mission {
    let name: String
    let year: String
    let agency: String
    let details: String
}

struct MissionData {
    static let missions: [Mission] = [
        Mission(name: "Sputnik 1", year: "1957", agency: "Soviet Space Program", details: "First artificial Earth satellite."),
        Mission(name: "Vostok 1", year: "1961", agency: "Soviet Space Program", details: "First human in space (Yuri Gagarin)."),
        Mission(name: "Apollo 11", year: "1969", agency: "NASA", details: "First humans to land on the Moon."),
        Mission(name: "Voyager 1", year: "1977", agency: "NASA", details: "Farthest human-made object from Earth."),
        Mission(name: "Hubble Space Telescope", year: "1990", agency: "NASA / ESA", details: "Revolutionized astronomy with deep space images."),
        Mission(name: "Mars Pathfinder", year: "1997", agency: "NASA", details: "First successful rover on Mars (Sojourner)."),
        Mission(name: "Cassini-Huygens", year: "1997", agency: "NASA / ESA / ASI", details: "Extensive study of Saturn and its moons."),
        Mission(name: "Kepler Space Telescope", year: "2009", agency: "NASA", details: "Discovered thousands of exoplanets."),
        Mission(name: "Curiosity Rover", year: "2011", agency: "NASA", details: "Investigated Martian climate and geology."),
        Mission(name: "New Horizons", year: "2015", agency: "NASA", details: "First spacecraft to explore Pluto up close."),
        Mission(name: "James Webb Telescope", year: "2021", agency: "NASA / ESA / CSA", details: "Most powerful infrared telescope ever built."),
        Mission(name: "Artemis I", year: "2022", agency: "NASA", details: "Uncrewed Moon-orbiting mission testing the SLS.")
    ]
}
