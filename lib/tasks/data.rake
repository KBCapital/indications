namespace :data do
  task environment: :inital_load do
    # load data from google doc CSV
    # first row, column 1 is indication
    # second row is headers
    # - first column is drug name
    # - second column is company
    # - third column is company ticker
    # - fourth column is phase of trial
    # - rest of columns go into trial attribute blob
  end
end
