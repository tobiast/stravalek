class Trackpoint
  
  attr_accessor :watts_calc, :altitude, :watts, :velocity_smooth, :grade_smooth, :total_elevation, 
  :distance, :cadence, :heartrate, :latlng, :time, :moving, :resting, :temp, :outlier, :grade_smooth
  
      def to_json(*a)
          {
            'time' => @time,
            'heartrate' => @heartrate,
            'altitude' => @altitude,
            'watts' => @watts,
            'velocitySmooth' => @watts, 
            'gradeSmooth' => @watts,
            'totalElevation' => @watts,
            'distance' => @distance,
            'cadence' => @cadence   
                   
            }.to_json(*a) 
      end
end