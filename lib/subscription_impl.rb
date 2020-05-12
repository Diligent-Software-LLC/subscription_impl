# Copyright (C) 2020 Diligent Software LLC. All rights reserved. Released
# under the GNU General Public License, Version 3. Refer LICENSE.txt.

require_relative "subscription_impl/version"
require 'node'
require 'node_diagram'
require 'node_subscription_impl'

# Subscription.
# @class_description
#   A Subscription library implementation.
class Subscription < SubscriptionInt

  # self.subscribable().
  # @description
  #   Gets SUBSCRIBABLE.
  # @return [Set]
  #   SUBSCRIBABLE's reference.
  def self.subscribable()
    return SUBSCRIBABLE
  end

  # self.publishable().
  # @description
  #   Gets PUBLISHABLE.
  # @return [Set]
  #   PUBLISHABLE's reference.
  def self.publishable()
    return PUBLISHABLE
  end

  # self.s_instance(subscriber = nil).
  # @description
  #   Predicate. Verifies an object is a subscribable type's instance.
  # @param subscriber [.]
  #   Any subscribable instance.
  # @return [TrueClass, FalseClass]
  #   True in the case subscriber is a subscribable type's instance. False
  #   otherwise.
  def self.s_instance(subscriber = nil)
    subscriber_c = subscriber.class()
    return (subscribable().include?(subscriber_c))
  end

  # self.publisher(published = nil).
  # @description
  #   Predicate. Verifies a published argument is a publishing type instance.
  # @param published [.]
  #   Any publishing type instance.
  # @return [TrueClass, FalseClass]
  #   True in the case published's class is a publisher. False otherwise.
  def self.publisher(published = nil)
    p_class = published.class()
    return (publishable().include?(p_class))
  end

  # self.update(subject = nil).
  # @description
  #   Updates subscribers.
  # @param subject [.]
  #   Any subscribable instance.
  # @return [NilClass]
  #   nil.
  def self.update(subject = nil)

    k_s_i          = kind_subscription(subject)
    kind_singleton = k_s_i.instance()
    kind_singleton.update_subscribers(subject)
    return nil

  end

  # self.kind_subscription(publisher = nil).
  # @description
  #   Discerns the appropriate subscription identifier.
  # @param published [.]
  #   Any subscribable type.
  # @return [Constant]
  #   A subscription constant.
  # @raise [ArgumentError]
  #   In the case the argument is not subscribable.
  def self.kind_subscription(published = nil)

    unless (publisher(published))
      raise(ArgumentError, "#{published} is not a subscribable instance.")
    else
      case
      when published.instance_of?(Node)
        return NodeSubscription
      end
    end

  end

  # Private constants.
  SUBSCRIBABLE = Set[NodeDiagram].freeze()
  PUBLISHABLE  = Set[Node].freeze()

  private_constant :SUBSCRIBABLE
  private_constant :PUBLISHABLE
  private_class_method :new
  private_class_method :kind_subscription

end
