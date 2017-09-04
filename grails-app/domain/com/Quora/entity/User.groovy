package com.Quora.entity

class User {

	transient springSecurityService

	String username
	String password
	String email
	String firstName
	String lastName
	byte [] photo
	boolean isAdmin
	boolean isActive
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		email blank: false,unique: true
		password blank: false
		photo nullable: true
	}

		User(String username, String password, String email ,String firstName, String lastName, isAdmin = false, isActive = false , enabled = true, accountExpired = false, accountLocked = false, passwordExpired = false) {
			this()
		this.username = username
		this.password = password
		this.email = email
		this.firstName = firstName
		this.lastName = lastName
		this.isAdmin = isAdmin
		this.isActive = isActive
		this.enabled = enabled
		this.accountExpired = accountExpired
		this.accountLocked = accountLocked
		this.passwordExpired = passwordExpired
	}
	static mapping = {
		password column: '`password`'
		autoTimestamp true
	}

	static hasMany = [topics : Topic , subscriptions : Subscription ,resources : Resource ,readingItems : ReadingItem]


	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role }
	}

	def beforeInsert() {
		println "Before Insert"
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}
