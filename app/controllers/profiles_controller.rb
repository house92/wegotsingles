class ProfilesController < ApplicationController

  def index
    conditions = []
    unless params[:with_desires].blank?
      conditions << "cd.desire_id = #{(params[:with_desires])}"
    end
    unless params[:with_ethnicities].blank?
      conditions << "ce.ethnicity_id = #{(params[:with_ethnicities])}"
    end
    unless params[:with_religions].blank?
      conditions << "cr.religion_id = #{(params[:with_religions])}"
    end
    unless params[:with_languages].blank?
      conditions << "cl.language_id = #{(params[:with_languages])}"
    end
    unless params[:with_gender].blank?
      conditions << "p.gender = '#{(params[:with_gender])}'"
    end
    unless params[:with_smoker].blank?
      conditions << "p.smoker = '#{(params[:with_smoker])}'"
    end
    @profiles = Profile.find_by_sql("SELECT DISTINCT c.id, p.id AS profile_id, c.username, p.gender, p.smoker, p.default_avatar_id
    FROM customers AS c
      INNER JOIN profiles AS p ON c.id = p.customer_id
      LEFT OUTER JOIN customer_ethnicities AS ce ON c.id = ce.customer_id
      LEFT OUTER JOIN customer_religions AS cr ON c.id = cr.customer_id
      LEFT OUTER JOIN customer_languages AS cl ON c.id = cl.customer_id
      LEFT OUTER JOIN customer_desires AS cd ON c.id = cd.customer_id
    #{conditions.empty? ? "" : "WHERE "}#{conditions.join(" AND ")}")
    respond_to do |format|
      format.html
      format.js
    end
  end

end
