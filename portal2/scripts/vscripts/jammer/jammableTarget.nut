jammers <- 0

function SetJammable(entity) {
  jammable <- entity
}

function Target() {
  jammers += 1
  jammable.GetScriptScope().Update()
}

function Untarget() {
  jammers -= 1
  jammable.GetScriptScope().Update()
}

function IsJammed() {
  return jammers > 0
}