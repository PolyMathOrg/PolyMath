initialize-release
initializeDdd
"this overrides defaults in initialize"
self result: #(1.1 2.2).
self argument: #()."necessary since otherwise the default values defined in #initialize would be used"
self parameter: #().