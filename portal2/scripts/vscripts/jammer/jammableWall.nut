function IsJammed() {
  return jammers[0].GetScriptScope().IsJammed() || jammers[1].GetScriptScope().IsJammed() || jammers[2].GetScriptScope().IsJammed()
}

function Init() {
  wall <- EntityGroup[0]
  jammers <- [EntityGroup[1], EntityGroup[2], EntityGroup[3]]
  EntityGroup[1].GetScriptScope().SetJammable(self)
  EntityGroup[2].GetScriptScope().SetJammable(self)
  EntityGroup[3].GetScriptScope().SetJammable(self)
}

function Update() {
  if (IsJammed()) {
    EntFireByHandle(wall, "Disable", "", 0, null, null)
    EntFireByHandle(self, "FireUser1", "", 0, null, null)
  } else {
    EntFireByHandle(wall, "Enable", "", 0, null, null)
    EntFireByHandle(self, "FireUser2", "", 0, null, null)
  }
}
