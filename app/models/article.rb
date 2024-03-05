# frozen_string_literal: true

# Model class from generator.
class Article < ApplicationRecord
  validates :title, presence: true

  # Starting variants, this should be a sensible default since we know that it
  # is an image:
  has_one_attached :image do |image|
    image.variant :gallery, resize_to_limit: [300, 300]
    image.variant :thumb, resize_to_limit: [100, 100]
  end

  # Starting validation for images, it should be a sensible default.
  validates :image, content_type: %i[jpg jpeg png]
  # Example with additional validations (presence and size)
  # validates :image, attached: true, content_type: %i[jpg jpeg png], size: { less_than_or_equal_to: 1.megabyte }

  # Returns nil if image is not attached or if it's file is not
  # persisted yet, or the attachment eitherwise.
  #
  # Useful when changing a record to identify pre-existing files that have a
  # signed_id from those that don't (and might need to be handled differently
  # if the change does not go through).
  def persisted_image
    image if image.attached? && image.valid? && image.blob.persisted?
  end
end
