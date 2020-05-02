jammers <- 0
last_jam_state <- 0

function Target() {
  jammers += 1
  Update()
}

function Untarget() {
  jammers -= 1
  Update()
}

function IsJammed() {
  return jammers > 0
}

function Update() {
  currently_jammed <- IsJammed()
  if (currently_jammed != last_jam_state) {
    last_jam_state <- currently_jammed
    if (currently_jammed) {
      EntFireByHandle(self, "FireUser1", "", 0, null, null)
    } else {
      EntFireByHandle(self, "FireUser2", "", 0, null, null)
    }
  }
}