class UserTreatment

  def call(user: user, type: type)
    @type = type
    relation = Hash.new {|h,k| h[k] = @type }
    relation[@type.class.to_s.underscore]
    @user  = user
    @trim  = user.treatments.build(relation)

    trim_facial_hair if type.is_a? TrimType
    @trim
  end

  def trim_facial_hair
    facial_hair = @user.facial_hair
    facial_hair.update_attributes(hair_length: @type.length, last_trimmed: Time.now)
    !false
  end
end
