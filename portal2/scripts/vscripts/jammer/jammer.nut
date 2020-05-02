/* Portal 2 Jammer script written by: Lord Von Adel */

DISTANCE_MIN <- 0
DISTANCE_MAX <- 512

carried <- true
jamTarget <- null

function Pickup() {
  carried <- true
  //Msg("Jammer pickup\n")
}

function Drop() {
  carried <- false
  //Msg("Jammer drop\n")
}

function IsActive() {
  return !carried
}

function Init() {
  self.ConnectOutput("OnPhysGunPickup", "Pickup")
  self.ConnectOutput("OnPhysGunDrop", "Drop")
}

function Think() {
  self.SetAngularVelocity(0, 0, 0)

  if (!IsActive()) {
    ResetJam()
    return
  }

  forward <- self.GetForwardVector()
  position <- self.GetOrigin() + Vector(0, 0, 48)

  target <- CustomTrace("scripted_target", position + forward * DISTANCE_MIN, position + forward * DISTANCE_MAX, 32, 64)
  if (target) {
    if (target == jamTarget) return;
    if (jamTarget) {
      jamTarget.GetScriptScope().Untarget()
    }

    if (!ValidateTrace(position + forward * 10, target)) {
      return;
    }

    target.GetScriptScope().Target()
    jamTarget <- target
    DoEntFire("!self", "FireUser1", "", 0, self, self)
  } else {
    ResetJam()
  }
}

function CustomTrace(classname, start, end, resolution, radius) {
  distance <- (end - start)
  steps <- (end-start).Length() / resolution
  for (i <- 0; i < steps; i++) {
    loc <- start + distance * (i / steps)
    //DebugDrawBox(loc, Vector(-2, -2, -2), Vector(2, 2, 2), 255, 0, 0, 255, 1)
    nearest <- Entities.FindByClassnameNearest(classname, loc, radius)
    if (nearest) {
      return nearest
    }
  }
  return null
}

function ValidateTrace(start, object) {
  return TraceLine(start, object.GetOrigin(), self) > 0.9;
}

function ResetJam() {
  if (jamTarget) {
    jamTarget.GetScriptScope().Untarget()
    jamTarget = null
    DoEntFire("!self", "FireUser2", "", 0, self, self)
  }
}

Init()