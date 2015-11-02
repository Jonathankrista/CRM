load 'contact.rb'

class CRM

	# Constructor -- Called when object is initialized!
	def initialize(name)
		@name = name
		@contacts = []
		@isExited = false
	end

	# Main Menu Printing
	def print_main_menu
		puts "[1] Add a new contact"
		puts "[2] Modify an existing contact"
		puts "[3] Delete a contact"
		puts "[4] Display all the contacts"
		puts "[5] Display an attribute"
		puts "[6] Exit"
	end

	# Handle Functions
	def handle_user_options

		# Getting User Input (Selected Option)
		puts "Enter a number: "
		user_selected = gets.to_i

		# Handling depending on the user selected option
		add_new_contact if user_selected == 1
		modify_existing_contact if user_selected == 2
		delete_contact if user_selected == 3
		display_all_contacts if user_selected == 4
		display_an_attribute if user_selected == 5
		exit_out if user_selected == 6
	end

	# Adding new contact in an array
	def add_new_contact

		# Getting information from user
		puts "Enter your firstname"
		firstName = gets

		puts"Enter your Lastname"
		lastName = gets

		puts"Enter Email"
		email = gets

		puts "Enter notes"
		notes = gets

	  # Making a contact object
	  contact = Contact.new(firstName, lastName, email, notes)
	  @contacts << contact # Putting newly created object in array.
	end

	def display_all_contacts
		# Iterating through the array to print all the existing contacts
		for index in 0 ... @contacts.size
			puts "Contact Information for ID: #{@contacts[index].id}"
			puts "FirstName: #{@contacts[index].first_name}"
			puts "LastName: #{@contacts[index].last_name}"
			puts "Email: #{@contacts[index].email}"
			puts "Notes: #{ @contacts[index].notes}"
		end
	end

	def exit_out
		@isExited = true
	end


	def delete_contact
		puts "what do you want to delete"
		deleteId = gets.to_i

		for index in 0 ... @contacts.size
			if deleteId == @contacts[index].id
				puts "Deleting contact"
				@contacts.delete_at(index)
			end
		end

	end

	def modify_existing_contact
		puts "Enter the id you want to modify"
		id = gets.to_i

		contact = findContact(id) # Trying to find the contact
		if contact == nil
			puts "Contact is not created"
		else
			modify_existing_contact_helper(contact)
		end
	end

	def modify_existing_contact_helper(contact)
		print_modifying_menu
		user_selected = gets.to_i
		modify_contact(contact, user_selected)
	end

	def print_modifying_menu
		puts "[1] Do you want to modify first name?"
		puts "[2] Do you want to modify last name?"
		puts "[3] Do you want to modify email?"
	end

	def modify_contact(contact, user_selected)
		if user_selected == 1
			puts "Enter the firstName: "
			firstName = gets
			contact.first_name = firstName

		elsif user_selected == 2
			puts "Enter the lastName: "
			lastName = gets
			contact.last_name = lastName


		elsif user_selected == 3
			puts "Enter the email: "
			emailName = gets
			contact.email = emailName
		end

	end

	def findContact(user_enter_id)

		# Looking for Contact object that has the same id as user given id.
		for index in 0 ... @contacts.size
	  	# If this if statement is true --> Found a contact object that matches user given id.
	  	if user_enter_id == @contacts[index].id
	  		return @contacts[index]
	  	end
	  end

  	# Couldn't find a contact object that has same user given id.
  	return nil
  end

  def run
  	while !@isExited do
  		print_main_menu
  		handle_user_options
  	end
  end


  def self.run(name)
  	crm = CRM.new(name)
  	crm.run
  end


end

CRM.run("my CRM") # class method

