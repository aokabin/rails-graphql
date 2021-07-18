module Types
	class BaseFile < GraphQL::Schema::Scalar
		description 'file'

		def self.coerce_input(action_dispatch_uploaded_file, _context)
			action_dispatch_uploaded_file
		end
	end
end