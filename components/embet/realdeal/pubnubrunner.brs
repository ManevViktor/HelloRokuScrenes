
sub initPubnubLib()
      m.pblib = createObject("roSGNode", "ComponentLibrary")
      m.pblib.id = "PubNubRoku"
      m.pblib.uri = "pkg:/components/external/pubnb.zip"
      m.pblib.observeField("loadStatus", "onpbStatus")

end sub



sub onpbStatus(ev)
      status = ev.getData()
      if status = "ready" then
            ?"Load lib ready"

            m.pubnub = createObject("roSGNode", "PubNubRoku:pubnubTask")
            m.pubnub.debug = true
            params = { subscribeKey: "sub-c-57fa010c-b8db-11ec-a091-7ec486788b75", publishKey: "pub-c-b475f60f-5f12-4537-a7ff-93bd7a3c0388", channels: ["demo", "demo2"] }
            m.pubnub.config = params
            m.pubnub.ObserveField("pubnubData", "onPubnubLibData")
            m.pubnub.control = "RUN"

            ' m.bcLib = createObject("roSGNode", "Embet:MultibetWidget")
            ' Lib was successfully downloaded and all its components are now accessible

      else if status = "loading" then
            ?"Load lib Loading"

            ' bcLib package is currently being downloaded

      else if status = "failed" then
            ?"Load lib failed"
            ' Something went wrong with the bcLib download/load process.
            ' Please check if the package URL was properly set.

      end if
end sub

sub onPubnubLibData(event as dynamic)
      ?"printing event" event
    
      brm = event.getData()
      ?event.getData()
      ?"data"  brm.data.data
      ?"event =" brm.data.data.event
      ?"payload =" brm.data.data.payload

      m.top.dataUpdate = brm.data.data.payload
    
    end sub