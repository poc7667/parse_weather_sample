#!/usr/bin/env python
# -*- coding: utf-8 -*-
#  Copyright 2000-2014 4AM tech, Inc. All rights reserved.
#  +-----------------------------------------------------------------+
#  | THIS SOFTWARE IS FURNISHED UNDER A LICENSE AND MAY ONLY BE USED |
#  | AND COPIED IN ACCORDANCE WITH THE TERMS AND CONDITIONS OF SUCH  |
#  | A LICENSE AND WITH THE INCLUSION OF THE THIS COPY RIGHT NOTICE. |
#  | THIS SOFTWARE OR ANY OTHER COPIES OF THIS SOFTWARE MAY NOT BE   |
#  | PROVIDED OR OTHERWISE MADE AVAILABLE TO ANY OTHER PERSON. THE   |
#  | OWNERSHIP AND TITLE OF THIS SOFTWARE IS NOT TRANSFERRED.        |
#  |                                                                 |
#  | THE INFORMATION IN THIS SOFTWARE IS SUBJECT TO CHANGE WITHOUT   |
#  | ANY PRIOR NOTICE AND SHOULD NOT BE CONSTRUED AS A COMMITMENT BY |
#  | VIVOTEK INC.                                                    |
#  +-----------------------------------------------------------------+
#  -------------------------------------------------------------------
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import re
import os
import pdb
import traceback
import logging
import time
import datetime
import json
# Third-party modules
from awesome_print import ap
from ish_parser import ish_parser
from ish_report import ish_report, ish_reportException
import glob
# Load custom modules
# -----------------------------------------------------------------
def get_source_files():
  source_files = []
  for file in glob.glob('./*'):
    if '.json' not in file:
        source_files.append(file)
  return source_files



def get_precipitation(report):
    if report.precipitation:
        return [report.precipitation[0]["hours"],report.precipitation[0]["depth"].MILLIMETERS]
    else:
        return ["null","null"]

def convert_file_to_json(sample_file):
    print(sample_file)
    export_weather_list = []
    with open(sample_file) as fp:
        content = fp.read()
    wp = ish_parser()
    wp.loads(content)
    try:
        reports = wp.get_reports()
    except BaseException:
        pass
    for (i, report) in enumerate(reports):
        precip_hour, precip_depth = get_precipitation(report)
        current_weather = {
            "report_type": str(report.report_type),
            "latitude": str(report.latitude),
            "longitude": str(report.longitude),
            "datetime": str(report.datetime),
            "air_temperature": str(report.air_temperature),
            "wban": str(report.wban),
            "weather_station": str(report.weather_station),
            "sea_level_pressure": str(report.sea_level_pressure),
            "dew_point_temperature": str(report.dew_point_temperature),
            "elevation": str(report.elevation),
            "visibility_distance": str(report.visibility_distance),
            "precipitation_hour": str(precip_hour),
            "precipitation_depth_in_mm": str(precip_depth)
        }
        export_weather_list.append(current_weather)
    with open(sample_file+'.json', 'w') as f:
        json.dump(export_weather_list, f)
def main():
    try:
        target_yearly_folders = ["./2014"]
        for folder in target_yearly_folders:
            os.chdir(folder)
            for source_file in  get_source_files():
                convert_file_to_json(source_file)
            os.chdir("../")

    except BaseException as e:
        traceback.print_exc(file=sys.stdout)
        pdb.set_trace()
        print(e)

if __name__ == '__main__':
    import doctest
    doctest.testmod()
    start_time = datetime.datetime.now()
    main()
    elapsed = datetime.datetime.now() - start_time
    print("Finished this task in  : {0} ".format(elapsed))

