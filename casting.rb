
class Actor

  attr_accessor :sex, :age

  def initialize(sex,age)
    @sex = sex
    @age = age
  end

  def can_play?(role)
    self.sex == role.sex && role.age_from <= self.age && self.age <= role.age_to
  end

  def all_roles_array(roles_array)
    all_roles =[]
    roles_array.each do |a|
      if self.can_play?(a)
        all_roles.push(a)
      end
    end
    all_roles
  end

  def avr_grade(role, commission_array)
    grade_array = []
    commission_array.each do |commission|
      start_int = 1
      end_int = 10
      if commission.sex == 'female' && role.for_role.duration < 30
        end_int = 7
      elsif commission.sex == 'male' && self.sex == 'female' && (18..25).include?(self.age)
        start_int = 7
      end
      dia = Range.new(start_int, end_int)
      grade_array.push(rand(dia))
    end
    sum = 0
    grade_array.each do |gr|
      sum = sum + gr
    end
    sum/grade_array.size
  end

  def best_role(roles_array, commission_array)
    max = 0
    max_role = nil
    all_roles_array(roles_array).each do |a|
      abc = avr_grade(a, commission_array)
      if abc> max
        max = abc
        max_role = a
      end

    end
    max_role
  end

  def all_act_duration(roles_array)
    all_duration = 0
    all_roles_array(roles_array).each do |dur|
      all_duration = all_duration + dur.for_role.duration
    end
    all_duration
  end
end

class Role

  attr_accessor :sex, :age_from, :age_to, :for_role

  def initialize(sex,age_from, age_to, for_role)
    @sex = sex
    @age_from = age_from
    @age_to = age_to
    @for_role = for_role
  end

end

class Act

  attr_accessor :topic, :text, :duration

  def initialize(topic, text)
   @topic = topic
   @text = text
   @duration = text.split(' ').size
  end

end

class Commission
  attr_accessor :sex

  def initialize(sex)
    @sex = sex
  end


end

actor1 = Actor.new('male', 24)
actor2 = Actor.new('male', 34)
actor3 = Actor.new('female',23)

for_role1 = Act.new("Topic1", "Vestibulum vitae auctor tellus, vitae vestibulum arcu. In feugiat massa lorem, non tempus mauris mollis ut. Mauris volutpat aliquam leo, in tempus purus luctus quis. Integer purus enim, rhoncus vel sagittis nec, accumsan at sapien. ")
for_role2 = Act.new("Topic2", "Pellentesque sed sollicitudin justo. Vivamus a ultrices nibh, quis sollicitudin purus. Fusce pulvinar ante mi, non tristique leo luctus a. Praesent hendrerit hendrerit nulla id. ")
for_role3 = Act.new("Topic3", "Quis sollicitudin purus. Fusce pulvinar ante mi, non tristique leo luctus a. Praesent hendrerit hendrerit nulla id. ")
for_role4 = Act.new("Topic4","In feugiat massa lorem, non tempus mauris mollis ut. Mauris volutpat aliquam leo, in tempus purus luctus quis" )


role1 = Role.new('male', 20, 30, for_role1)
role2 = Role.new('female', 15, 40, for_role2)
role3 = Role.new('male', 12, 14,for_role3)
role4 = Role.new('female', 20, 30, for_role4)

roles_array = [role1, role2, role3,role4]

commission1 = Commission.new('female')
commission2 = Commission.new('female')
commission3 = Commission.new('female')
commission4 = Commission.new('male')
commission5 = Commission.new('male')
commission6 = Commission.new('male')

commission_array = [commission1, commission2, commission3, commission4, commission5, commission6]
