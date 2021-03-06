class ApiController < ApplicationController

  def new
    new_ihealth_bp
    new_ihealth_bo
    @fitbit_hr = new_fitbit_hr
    new_fitbit
    @output = {}
    if @i_health_bp.bp_data_list != []
      @output["bp_data_list"] = @i_health_bp.bp_data_list
      @output["bp_dummy"] = false
    else
      @output["bp_data_list"] = [
        {
          'sys' => '120',
          'dia' => '80',
          'date' => '08-06-2016'
        },
        {
          'sys' => '125',
          'dia' => '83',
          'date' => '08-07-2016'
        },
        {
          'sys' => '130',
          'dia' => '91',
          'date' => '08-08-2016'
        },
        {
          'sys' => '128',
          'dia' => '88',
          'date' => '08-09-2016'
        },
        {
          'sys' => '119',
          'dia' => '79',
          'date' => '08-10-2016'
        },
        {
          'sys' => '115',
          'dia' => '76',
          'date' => '08-11-2016'
        },
        {
          'sys' => '123',
          'dia' => '81',
          'date' => '08-12-2016'
        }
      ]
      @output["bp_dummy"] = true
    end

    @output["bp_unit"] = @i_health_unit
    if @i_health_bo.bo_data_list != []
      @output["bo_data_list"] = @i_health_data_list
      @output["bo_dummy"] = false
    else
      @output["bo_data_list"] = [
        {
          'oxy' => '95',
          'date' => '08-06-2016'
        },
        {
          'oxy' => '92',
          'date' => '08-07-2016'
        },
        {
          'oxy' => '91',
          'date' => '08-08-2016'
        },
        {
          'oxy' => '89',
          'date' => '08-09-2016'
        },
        {
          'oxy' => '93',
          'date' => '08-10-2016'
        },
        {
          'oxy' => '97',
          'date' => '08-11-2016'
        },
        {
          'oxy' => '99',
          'date' => '08-12-2016'
        },

      ]
      @output["bo_dummy"] = true
    end
    # p @fitbit_hr
    # p "*" * 50
    if @fitbit_hr != []
      @output['hr_data_list'] = @fitbit_hr
      @output['hr_dummy'] = true
    else
      @output["hr_data_list"] = [
        {
          "heart_rate": '85',
          "date": "08-06-2016"
        },
        {
          "heart_rate": '90',
          "date": "08-07-2016"
        },
        {
          "heart_rate": '105',
          "date": "08-08-2016"
        },
        {
          "heart_rate": '124',
          "date": "08-09-2016"
        },
        {
          "heart_rate": '99',
          "date": "08-10-2016"
        },
        {
          "heart_rate": '85',
          "date": "08-11-2016"
        },
        {
          "heart_rate": '87',
          "date": "08-12-2016"
        }
      ]
      @output["hr_dummy"] = true
    end

    @output["age"] = @fitbit.age
    @output["name"] = @fitbit.name
    @output["weight"] = @fitbit.weight
    @output["height"] = @fitbit.height
    @output["gender"] = @fitbit.gender
    render json: @output
  end



  def new_ihealth_bp
    @i_health_bp = Ihealth.new
    @i_health_bp.send_api_request_bp
    @i_health_bp.parse_bp
  end

  def new_ihealth_bo
    @i_health_bo = Ihealth.new
    @i_health_bo.send_api_request_bo
    @i_health_bo.parse_bo
  end

  def new_fitbit
    @fitbit = Fitbit.new
    @fitbit.send_api_request
    @fitbit.parse
  end

  def new_fitbit_hr
    @fitbit_hr = Fitbit.new
    @fitbit_hr.send_api_request_hr
    @fitbit_hr.parse_hr
    @fitbit_hr.arrayify_hr
  end

end
