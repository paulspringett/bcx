# Bcx::Resources::Access
#
# Provides access to accesses resource at per-project level
#
# #### Get accesses for a project
# `GET /projects/1/accesses.json`
#
#     client.projects(1).accesses!
#
# #### Grant access
# `POST /projects/1/accesses.json`
#
#     client.projects(1).accesses.create!(ids: [ 5, 6, 10])
#
# #### Revoke access
# `DELETE /projects/1/accesses/1.json`
#
#     client.projects(1).accesses(1).delete!
#
module Bcx
  module Resources
    class Access < Rapidash::Base

    end
  end
end
