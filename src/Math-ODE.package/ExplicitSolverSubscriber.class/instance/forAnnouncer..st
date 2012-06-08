subscription
forAnnouncer: anAnnouncer
	anAnnouncer on: ExplicitSolverAnnouncement do: self block.
	announcers add: anAnnouncer.